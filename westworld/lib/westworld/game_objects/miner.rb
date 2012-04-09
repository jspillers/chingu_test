class Miner < BaseObject
  attr_accessor :location, :gold_carried, :money_in_bank, :thirst, :fatigue, :x, :y

  traits :timer, :vocal, :velocity

  def initialize(opts)
    @gold_carried = 0
    @money_in_bank = 0
    @thirst = 0
    @fatigue = 0

    super(opts)

    @animation = Chingu::Animation.new(file: "miner_73x109.png", delay: 500)
    @animation.frame_names = { default: 0..0, mining: 0..1 }
    @frame_name = :mining

    every(1000) do
      @thirst += 1
      execute
    end
  end

  def update
    @image = @animation[@frame_name].next
  end

  def pockets_full?
    @gold_carried >= 5
  end

  def thirsty?
    @thirst >= 10  
  end

  def tired?
    @fatigue >= 30
  end

  state_machine :state, :initial => :go_home_and_sleep_until_rested do

    event :full_of_gold do
      transition :enter_mine_and_dig_for_nugget => :visit_bank_and_deposit_gold
    end

    event :thirsty do
      transition :enter_mine_and_dig_for_nugget => :quench_thirst
    end

    event :not_thirsty do
      transition :quench_thirst => :enter_mine_and_dig_for_nugget
    end

    event :rested do
      transition :go_home_and_sleep_until_rested => :enter_mine_and_dig_for_nugget
    end

    event :pockets_full do
      transition :enter_mine_and_dig_for_nugget => :visit_bank_and_deposit_gold
    end

    event :deposited_all_gold do
      transition :visit_bank_and_deposit_gold => :enter_mine_and_dig_for_nugget
    end

    event :tired do
      transition :enter_mine_and_dig_for_nugget => :go_home_and_sleep_until_rested
    end

    before_transition any => :enter_mine_and_dig_for_nugget do |miner, trans|
      miner.speak 'Walkin to the gold mine'
      @location = 'mine'
    end

    before_transition :enter_mine_and_dig_for_nugget => :visit_bank_and_deposit_gold do |miner, trans|
      miner.speak 'Mah pockets are full...'
    end

    before_transition :enter_mine_and_dig_for_nugget => :quench_thirst do |miner, trans|
      miner.speak 'Sure am thirsty!'
    end

    before_transition any => :visit_bank_and_deposit_gold do |miner, trans|
      miner.speak 'Walkin to the bank'
      @location = 'bank'
    end

    before_transition any => :go_home_and_sleep_until_rested do |miner, trans|
      miner.speak 'Walkin to the shack'
      @location = 'home'
    end

    before_transition any => :quench_thirst do |miner, trans|
      miner.speak 'Walkin to the saloon'
      @location = 'saloon'
    end

    state :enter_mine_and_dig_for_nugget do 
      def execute
        return if @traveling

        @fatigue += 1

        speak 'Mining for some gold'
        if 1 + rand(6) > 3
          speak 'Got me a nugget!'
          @gold_carried += 1
        else
          speak 'couldn\'t find any gold'
        end

        tired if tired?
        thirsty if thirsty?
        pockets_full if pockets_full?
      end
    end

    state :visit_bank_and_deposit_gold do
      def execute
        return if @traveling
        @money_in_bank += @gold_carried
        @gold_carried = 0
        speak 'Money in the bank baby!'
        deposited_all_gold
      end
    end

    state :go_home_and_sleep_until_rested do
      def execute
        return if @traveling
        speak 'ZzzZzZzz'
        @fatigue -= 1
        rested if @fatigue <= 0
      end
    end

    state :quench_thirst do
      def execute
        return if @traveling
        speak 'havin a drink *gulp gulp*'
        @thirst -= 2
        not_thirsty if @thirst <= 0
      end
    end
  end
end

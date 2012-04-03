module Chingu
  module Traits
    module Vocal

      def setup_trait(options)
        @speak_output = Chingu::Text.create('', :size => 20, :x => options[:x] + 50, :y => options[:y])
        super
      end

      def speak(text)
        puts text
        @speak_output.text = text
      end

    end
  end
end


module LogStashLogger
  module Device
    class Base
      attr_reader :io

      def initialize(opts={})
        @io = nil
      end

      def to_io
        @io
      end

      def write(message)
        @io.write(message)
      end

      def flush
        @io && @io.flush
      end

      def close
        @io && @io.close
      rescue => e
        warn "#{self.class} - #{e.class} - #{e.message}"
      ensure
        @io = nil
      end
    end
  end
end
module Shiphawk
  class Error < StandardError

    attr_reader :code

    def initialize(code, message)
      @code = code
      @message = message
    end

    def to_s
      "Shiphawk::Error: (#{@code}) #{@message}"
    end

  end
end

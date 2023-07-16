class TagRequestPart < Liza::Part

  insertion do
    def tag
      @tag ||= TagRequestPart::Extension.new(self)
    end
  end

  extension do
    def open name, attrs = {}
      return "<#{name}>" unless attrs.any?
      attrs = attrs.map { |k, v| "#{k}=\"#{v}\"" }.join " "
      "<#{name} #{attrs}>"
    end

    def call name, attrs = {}
      "#{open name, attrs}#{close name}"
    end

    def close name
      "</#{name}>"
    end
  end

end

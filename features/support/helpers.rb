class DIGHelpers
    def fill_in_xpath(locator, options={})
        locator, options = nil, locator if locator.is_a? Hash
        raise "Must pass a hash containing 'with'" if not options.is_a?(Hash) or not options.has_key?(:with)
        with = options.delete(:with)
        find(:xpath, locator).set(with)
    end
end

World do
  DIGHelpers.new
end

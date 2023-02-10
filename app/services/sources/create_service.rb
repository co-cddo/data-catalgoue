module Sources
  class CreateService < BaseService
    def initialize(name:, url:)
      @name = name
      @url = url
    end

    def call
      Source.find_or_create_by(url: url) do |source|
        source.name = @name
      end
    end

    private

    def url
      Addressable::URI.parse(@url).normalize.to_s
    end
  end
end
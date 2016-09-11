module Jekyll
  class CloudinaryImageTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @image_name = text.split[0]
      @caption = text.split[1]
    end

    def cloudinary_url
      # Hard coded here so the whole blog uses consistent settings
      "https://res.cloudinary.com/stevenocchipinti" \
        "/image/upload/c_limit,h_600,w_600/" \
        "v1/cookislands2016/#{@image_name}"
    end

    def render(context)
      "<img src='#{cloudinary_url}' alt='#{@caption}'>"
    end
  end
end

Liquid::Template.register_tag('c_img', Jekyll::CloudinaryImageTag)

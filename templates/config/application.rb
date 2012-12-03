

    config.generators do |g|
      g.templates.unshift File::expand_path('../templates', __FILE__)
    end
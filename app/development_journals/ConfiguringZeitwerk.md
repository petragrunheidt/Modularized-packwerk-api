# Configuring Rails Autoload Paths for a Modularized Design

When developing a Rails application, organizing your code becomes crucial as the project scales. One way to achieve a modularized design is by configuring Rails autoload paths, and Zeitwerk is the gem that makes this process smooth.

## Understanding Zeitwerk

[Zeitwerk](https://github.com/fxn/zeitwerk) is a gem used by Rails for code autoloading. It follows conventions over configuration, allowing developers to structure their code in a way that aligns with Rails' expectations.

## Default Rails Autoloading

By default, Rails expects models, views, and controllers to reside directly within the `app` folder. Any other directories will be loaded with a namespace.

For example, consider a `serializers` directory within the `app` folder. In the conventional approach, a serializer class within this directory would be defined as follows:

```ruby
  class Serializers::ExampleSerializer
    # Serializer behavior
  end
```

While this convention is valid, it might become verbose, especially when applying a modularized approach. If we aim to organize models under specific domains and subdomains, the structure could look like this:

app/
└── models/
    └── domain/
        └── subdomains/
            └── example_model.rb

```rb
  class Domain::Subdomain::ExampleModel
    #Model like behaviour
  end
```

This structure adheres to modularization but can be verbose and may not align with your desired organization.

## Customizing Autoload Paths with Zeitwerk

To embrace a more modularized design while deviating from the default Rails conventions, you can reset Rails autoload paths and specify patterns to autoload from specific subdirectories. This can be achieved through your config/application.rb file:

```rb
    # Resets rails autoload paths
    config.autoload_paths = []

    # Autoloads and eager loads desired paths
    ['models', 'controllers', 'serializers'].each do |folder|
      path = Rails.root.join('app', '*', '*', folder)

      config.autoload_paths += Dir[path]
      config.eager_load_paths += Dir[path]
    end
```
**In this configuration:**

- `config.autoload_paths` is cleared to remove the default paths.
- Custom paths for models, controllers, and serializers are specified using the `Dir` glob pattern.
- The same paths are added to `config.eager_load_paths` for eager loading in production.

This approach allows you to structure your Rails application in a more modularized way, organizing your code based on domains, subdomains, and specific functionalities.

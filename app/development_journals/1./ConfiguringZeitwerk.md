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

    config.autoload_paths += Dir[Rails.root.join('domains', '**/')]
    config.eager_load_paths += Dir[Rails.root.join('domains', '**/')]
```

**In this configuration:**

- `config.autoload_paths` is cleared to remove the default paths.
- Custom paths for models, controllers, and serializers are specified using the `Dir` glob pattern.
- The same paths are added to `config.eager_load_paths` for eager loading in production.

This approach allows you to structure your Rails application in a more modularized way, organizing your code based on domains, subdomains, and specific functionalities.

In the context of this project, the folder structure ends up like this:

domains/
└── domain/
  └── subdomain/
    └── models/
    └── example_model.rb
    controllers/
    └── example_controller.rb
    serializers/
    └── example_serializer.rb

Now, instead of the verbose approach i can call the models without namespaces:

```rb
  class ExampleModel
    #Model like behaviour
  end
```

While the simplification of class names is a consequence of this choice, it isn't the primary objective. The main purpose of this modularized approach is to prevent unintentional interference between different domains. The goal is to mitigate high coupling and promote cohesion between modules.

### High Coupling and Cohesion Explanation

- **High Coupling:** In software engineering, coupling refers to the degree of interdependence between different components or modules. High coupling occurs when modules are closely connected, making changes in one module affect others. This can lead to a lack of flexibility and increased difficulty in maintaining and extending the codebase.

- **Cohesion:** Cohesion, on the other hand, refers to how closely the components within a module are related to each other. A module with high cohesion focuses on a single responsibility or functionality, making it self-contained and easier to understand. Cohesive modules often result in more maintainable and scalable code.

The modularized approach aims to minimize high coupling by organizing code based on domains and subdomains. Each module (e.g., models, controllers, serializers) is encapsulated within its domain, reducing the likelihood of unintentional interactions and enhancing overall code maintainability.

While adopting this structure serves as an encouragement for upholding code quality principles, Rails is inherently a permissive framework. In the upcoming article, we will delve into the implementation of a gem that seamlessly integrates with this modularized approach—the [Packwerk](https://github.com/Shopify/packwerk) gem.

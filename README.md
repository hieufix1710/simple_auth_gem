# Installation

```ruby
gem install hiu_auth
```

# Usage

To verify Google credentials, use the following method:

```ruby
HiuAuth.verify_google_credential(id_token)
```
To verify Facebook credentials, use the following method:

```ruby
HiuAuth.verify_facebook_credential(access_token)
```

# Building the Gem

To build the gem locally, run the following commands:

```bash
gem build hiu_auth.gemspec
```

This will generate a `.gem` file in the current directory. You can then install it locally using:

```bash
gem install ./hiu_auth-<version>.gem
```

# Publishing the Gem

To publish the gem to RubyGems, use the following command:

```bash
gem push ./hiu_auth-<version>.gem
```

Ensure you have a RubyGems account and are authenticated before running this command.
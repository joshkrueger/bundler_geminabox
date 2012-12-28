# bundler_geminabox


## What does it do?

It allows you to use the same friendly rake command that bundler provides for releasing gems.
```rake release``` retains the same build/tag/push functionality, except its now being pushed to your private gem repository. yay!

## Usage!

In your gemspec

```ruby
gem.add_development_dependency "bundler_geminabox"
```

In your gem's Rakefile, replace

```ruby
require 'bundler/gem_tasks'
```

with

```ruby
require "bundler_geminabox/gem_tasks"
```

Then simply

```bash
rake release
```

And your gem should be built, git tagged and pushed to your geminabox server.
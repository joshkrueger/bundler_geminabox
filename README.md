# bundler_geminabox


## What does it do?

It allows you to use the same friendly rake command that bundler provides for releasing gems.
```rake release``` retains the same build/tag/push functionality, except its now being pushed to your private gem repository. yay!

## Usage!

In your gemfile

```ruby
gem "bundler_geminabox"
```

In your gem's Rakefile, insert

```ruby
require "bundler_geminabox"
BundlerGeminabox::GemHelper.install
```

after

```ruby
Bundler::GemHelper.install_tasks
```

Then simply

```bash
rake release
```

And your gem should be built, git tagged and pushed to your geminabox server.
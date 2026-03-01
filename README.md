# active_link_to

`active_link_to` wraps Rails `link_to` and adds active-state behavior for navigation links.

[![Gem Version](https://img.shields.io/gem/v/active_link_to.svg?style=flat)](https://rubygems.org/gems/active_link_to)
[![Gem Downloads](https://img.shields.io/gem/dt/active_link_to.svg?style=flat)](https://rubygems.org/gems/active_link_to)
[![CI](https://github.com/comfy/active_link_to/actions/workflows/ci.yml/badge.svg)](https://github.com/comfy/active_link_to/actions/workflows/ci.yml)

## Compatibility

| Gem version | Ruby | Rails (`actionpack`) |
| --- | --- | --- |
| `2.x` | `>= 3.4` | `>= 7.2`, `< 9.0` |
| `1.x` | legacy | legacy |

## Installation

Add this to your Gemfile:

```ruby
gem "active_link_to"
```

Then run:

```sh
bundle install
```

## Super Simple Example

Here's a link that will have a class attached if it happens to be rendered
on page with path `/users` or any child of that page, like `/users/123`.

```ruby
active_link_to "Users", "/users"
# => <a href="/users" class="active">Users</a>
```

This is exactly the same as:

```ruby
active_link_to "Users", "/users", active: :inclusive
# => <a href="/users" class="active">Users</a>
```

## Active Options

Available values for `:active`:

```
* Boolean                         -> true | false
* Symbol                          -> :exclusive | :inclusive | :exact
* Regex                           -> /regex/
* Controller/Action Pair          -> [[:controller], [:action_a, :action_b]]
* Controller/Specific Action Pair -> [controller: :action_a, controller_b: :action_b]
* Hash                            -> { param_a: 1, param_b: 2 }
```

## More Examples

Most functionality depends on current URL, specifically `request.original_fullpath`.

We want to highlight a link that matches the immediate URL, but not children nodes
(typically useful for "home" links).

```ruby
# For URL: /users will be active
active_link_to "Users", users_path, active: :exclusive
# => <a href="/users" class="active">Users</a>
```

```ruby
# For URL: /users/123 it will not be active
active_link_to "Users", users_path, active: :exclusive
# => <a href="/users">Users</a>
```

Regex-based active state:

```ruby
active_link_to "Users", users_path, active: %r{^/use}
```

Exact match (for example query-string filters):

```ruby
active_link_to "Users", users_path(role_eq: "admin"), active: :exact
```

Controller/action matching:

```ruby
# For matching multiple controllers and actions:
active_link_to "User Edit", edit_user_path(@user), active: [["people", "news"], ["show", "edit"]]

# For matching specific controllers and actions:
active_link_to "User Edit", edit_user_path(@user), active: [people: :show, news: :edit]

# For matching all actions under given controllers:
active_link_to "User Edit", edit_user_path(@user), active: [["people", "news"], []]

# For matching all controllers for a particular action:
active_link_to "User Edit", edit_user_path(@user), active: [[], ["edit"]]
```

Boolean active state:

```ruby
active_link_to "Users", users_path, active: true
```

Active state based on params:

```ruby
active_link_to "Admin users", users_path(role_eq: "admin"), active: { role_eq: "admin" }
```

## More Options

Custom active/inactive classes:

```ruby
active_link_to "Users", users_path, class_active: "enabled"
# => <a href="/users" class="enabled">Users</a>

active_link_to "News", news_path, class_inactive: "disabled"
# => <a href="/news" class="disabled">News</a>
```

Disable active links (render `<span>`):

```ruby
active_link_to "Users", users_path, active_disable: true
# => <span class="active">Users</span>
```

Wrap links in another tag (for menus):

```ruby
active_link_to "Users", users_path, wrap_tag: :li
# => <li class="active"><a href="/users">Users</a></li>
```

Add classes to the wrap tag:

```ruby
active_link_to "Users", users_path, wrap_tag: :li, wrap_class: "nav-item"
# => <li class="nav-item active"><a href="/users">Users</a></li>
```

## Helper Methods

`is_active_link?` returns true/false based on URL and `:active` value:

```ruby
is_active_link?(users_path, :inclusive)
# => true
```

`active_link_to_class` returns the CSS class:

```ruby
active_link_to_class(users_path, active: :inclusive)
# => "active"
```

## Development

Run tests:

```sh
bundle exec rake test
```

Run against a specific Rails series:

```sh
BUNDLE_GEMFILE=test/gemfiles/7.2.gemfile bundle exec rake test
BUNDLE_GEMFILE=test/gemfiles/8.0.gemfile bundle exec rake test
BUNDLE_GEMFILE=test/gemfiles/8.1.gemfile bundle exec rake test
```

## License

Copyright (c) 2009-2026 Oleg Khabarov.
Released under the MIT License. See [LICENSE](LICENSE).

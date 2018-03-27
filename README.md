# DI Example

This is a simple project to demonstrate a downside of bag-of-modules DI.


## Demonstration

* run the tests with `mix test`. They should pass.

* swap the definition of `DiTarget.foo` with the commented-out one, changing the declared arity of `foo`.

* run the tests again. Get a runtime error, but only on the test that doesn't use DI.

* go read that last line again. The test that used DI still passed, despite the code it claims to test being broken.

* uncomment the third test in `test/di_example_test.exs` and the `call_foo_direct` function in `lib/di_example.ex`.

* run the tests again. Note that now the code emits a compilation warning (would fail CI) because it can detect that `DiTarget.foo` is being called incorrectly.

I suspect there's similar impact with Dialyzer. Proving so is left as an exercise for the reader :)

## Resolution

This style of DI transforms compile-time errors into runtime errors.

It tells us lines are "covered" by tests when those tests don't provide any guarantee that the lines will work when run in production.

Behaviors likely avoid this issue, but that's additional boilerplate at every interface.

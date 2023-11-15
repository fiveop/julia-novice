# !!! yaml
#     ---
#     title: "Adding tests"
#     teaching: 10
#     exercises: 30
#     ---
#
# !!! questions
#     - "What are unit tests?"
#     - "How are tests organized in Julia?"
#
# !!! objectives
#     - "Learn to create unit tests and test-sets using the `Test` standard library"

# ## Unit tests

# Now that Melissa has released her first package she fears that future changes
# will impact the existing functionality of her package.
# This can be prevented by adding tests to her package.

# Looking at the structure of other packages Melissa figured out that tests
# usually go in a separate `test` folder next to the `src` folder.
# This should contain a `runtests.jl` file.

# The standard library `Test` provides the functionality for writing tests:
# namely, the macros `@test` and `@testset`.

# `@test` can be used to test a single equality, such as

using Test
@test 1 + 1 == 2



# Several tests can be grouped in a test-set with a descriptive name

using Test
@testset "Test arithmetic equalities" begin
    @test 1 + 1 == 2
end

# With this Melissa can run her test using the pkg mode of the REPL:

#md # ```julia
#md # (MelissasModule) pkg> test
#md # ```

#nb ] test

# ### Test specific dependencies

# Melissa needed to add `Test` to her package in order to run the code above, but
# actually `Test` is not needed for her package other than testing.
# Thus it is possible to move the `Test` entry in the `Project.toml` file from
# `[deps]` to an `[extras]` section and then add another entry:

# ```julia
# [targets]
# test = ["Test"]
# ```

# Check out the [sample project file](https://github.com/carpentries-incubator/julia-novice/blob/main/code/Project.toml) for a complete
# example.

# !!! freecode
#     Create a test for MelissasModule
#     Create a test that ensures that `shoot_distance` returns a value that is
#     between `target - ε` and `target + ε`.
#
#     !!! solution
#
#         ```julia
#         using MelissasModule
#         using Test
#
#         @testset "Test hitting target" begin
#            imprecise_trebuchet = Trebuchet(500.0, 0.25pi)
#            environment = Environment(5, 100)
#            precise_trebuchet = aim(imprecise_trebuchet, environment)
#            @test 100 - 0.1 <= shoot_distance(precise_trebuchet, environment) <= 100 + 0.1
#            # default ε is 0.1
#         end
#         ```

# !!! keypoints
#     - "Tests are important"

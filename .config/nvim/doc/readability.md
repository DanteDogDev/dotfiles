# readability

## [readability-identifier-naming](https://clang.llvm.org/extra/clang-tidy/checks/readability/identifier-naming.html)

Enforce consistent and meaningful naming conventions for identifiers.

Structs and Classes should be `CamelCase`

```yaml
  - key: readability-identifier-naming.ClassCase
    value: CamelCase
  - key: readability-identifier-naming.StructCase
    value: CamelCase
```

Global Variables should have `g_` prefix

```yaml
  - key: readability-identifier-naming.GlobalVariablePrefix
    value: 'g_'
```

Public Members should be `camelBack` case

```yaml
  - key: readability-identifier-naming.PublicMemberCase
    value: camelBack
```

Private Members should be `camelBack` case and have `m_` prefix

```yaml
  - key: readability-identifier-naming.PrivateMemberCase
    value: camelBack
  - key: readability-identifier-naming.PrivateMemberPrefix
    value: 'm_'
```

Protected Members should be `camelBack` case and have `m_` prefix

```yaml
  - key: readability-identifier-naming.ProtectedMemberCase
    value: camelBack
  - key: readability-identifier-naming.ProtectedMemberPrefix
    value: 'm_'
```

Parameter Case should be `lower_case`

```yaml
  - key: readability-identifier-naming.ParameterCase
    value: lower_case
```

Local Variables should be `lower_case`

```yaml
  - key: readability-identifier-naming.LocalVariableCase
    value: lower_case
```

Const Expressions should be `UPPER_CASE`

```yaml
  - key: readability-identifier-naming.ConstexprVariableCase
    value: UPPER_CASE
```

Macros should be `UPPER_CASE`

```yaml
  - key: readability-identifier-naming.MacroDefinitionCase
    value: UPPER_CASE
```

Namespaces should be `lower_case`

```yaml
  - key: readability-identifier-naming.NamespaceCase
    value: lower_case
```

Enums should be `CamelCase`

```yaml
  - key: readability-identifier-naming.EnumCase
    value: CamelCase
  - key: readability-identifier-naming.EnumConstantCase
    value: CamelCase
```

## [readability-avoid-const-params-in-decls](https://clang.llvm.org/extra/clang-tidy/checks/readability/avoid-const-params-in-decls.html)

Avoid using top-level `const` in function parameter declarations.

- Top-level `const` in function declarations does not affect the function's signature and should be avoided.
- Use `const` in the parameter type instead of at the top level.

## [readability-avoid-nested-conditional-operator](https://clang.llvm.org/extra/clang-tidy/checks/readability/avoid-nested-conditional-operator.html)

Avoid using nested conditional (ternary) operators for better readability.

- Nested ternary operators can make code harder to understand.
- Split them into multiple statements and use temporary variables for clarity.

## [readability-avoid-return-with-void-value](https://clang.llvm.org/extra/clang-tidy/checks/readability/avoid-return-with-void-value.html)

Avoid using return statements with expressions in functions that have a `void` return type.

- Functions with a `void` return type should not return a value.
- Returning a value in such functions can create confusion and miscommunicate the function's intended behavior.
- Instead of returning an expression, simply call the function and use a separate `return` statement.

## [readability-avoid-unconditional-preprocessor-if](https://clang.llvm.org/extra/clang-tidy/checks/readability/avoid-unconditional-preprocessor-if.html)

Avoid using unconditional preprocessor directives (`#if 0` or `#if 1`).

- `#if 0` disables code and `#if 1` enables code unconditionally, leading to dead code or always enabled code.
- This can make the code harder to understand, lead to abandoned functionality, and cause potential maintenance issues.
- Instead of using `#if 0` or `#if 1`, use conditional macros like `#ifdef DEBUGGING_ENABLED` or `#if FEATURE_X_ENABLED` to control code inclusion.

## [readability-const-return-type](https://clang.llvm.org/extra/clang-tidy/checks/readability/const-return-type.html)

Avoid using `const` in function return types when it’s unnecessary.

- The `const` qualifier in function return types is typically redundant and can hinder compiler optimizations.
- This check suggests removing `const` from return types that are top-level.

## [readability-container-contains](https://clang.llvm.org/extra/clang-tidy/checks/readability/container-contains.html)

Use `container.contains()` instead of `container.count()` or `container.find() == container.end()`.

- `container.contains()` is clearer in intent and often more efficient than `count()` or `find()`.
- For containers that allow multiple entries per key (like `std::multimap` or `std::multiset`), `contains()` avoids unnecessary extra work performed by `count()`.

## [readability-container-data-pointer](https://clang.llvm.org/extra/clang-tidy/checks/readability/container-data-pointer.html)

Use `container.data()` instead of manually getting the address of the first element.

- Containers like `std::vector` and `std::string` provide a `data()` method to get a pointer to the backing data, which should be used instead of accessing the first element’s address.
- This ensures safe behavior, especially when the container is empty, as `data()` handles the case where the container might not contain any elements.

## [readability-container-size-empty](https://clang.llvm.org/extra/clang-tidy/checks/readability/container-size-empty.html)

Use `container.empty()` instead of `container.size()` or `container.length()` when checking if a container is empty.

- The `empty()` method more clearly expresses intent and is more efficient for checking if a container is empty.
- Some containers (e.g., `std::forward_list`) implement `empty()` but not `size()` or `length()`, so using `empty()` ensures better portability.

## [readability-delete-null-pointer](https://clang.llvm.org/extra/clang-tidy/checks/readability/delete-null-pointer.html)

Avoid checking if a pointer is `nullptr` before calling `delete`.

- Deleting a null pointer has no effect, so the check for `nullptr` is unnecessary.
- Removing the check simplifies the code and improves readability.

## [readability-duplicate-include](https://clang.llvm.org/extra/clang-tidy/checks/readability/duplicate-include.html)

Remove duplicate `#include` directives.

- This check identifies and removes redundant `#include` statements to keep the code clean and efficient.
- If a macro is defined or undefined between includes, the check resets and allows for correct handling.

## [readability-else-after-return](https://clang.llvm.org/extra/clang-tidy/checks/readability/else-after-return.html)

Avoid using `else` after `return`, `break`, `continue`, or `throw`.

- When control flow is interrupted by `return`, `break`, `continue`, or `throw`, using `else` is redundant and adds unnecessary indentation.

## [readability-enum-initial-value](https://clang.llvm.org/extra/clang-tidy/checks/readability/enum-initial-value.html)

Enforces Consistent initial values for `enums`

## [readability-function-size](https://clang.llvm.org/extra/clang-tidy/checks/readability/function-size.html)

Checks for large functions based on various metrics

Identifies compound statements that exceed a specified nesting level

```yaml
  - key: readability-function-size.NestingThreshold
    value: 3
```

## [readability-inconsistent-declaration-parameter-name](https://clang.llvm.org/extra/clang-tidy/checks/readability/inconsistent-declaration-parameter-name.html)

Find function declarations which differ in parameter names.

- This check ensures that the parameter names in the function declaration and definition are consistent.

## [readability-make-member-function-const](https://clang.llvm.org/extra/clang-tidy/checks/readability/make-member-function-const.html)

Finds non-static member functions that can be made `const` because the functions don’t use `this` in a non-const way.

- This check ensures that methods are logically marked as `const` if they do not modify the object’s state.

## [readability-math-missing-parentheses](https://clang.llvm.org/extra/clang-tidy/checks/readability/math-missing-parentheses.html)

Checks for missing parentheses in mathematical expressions with operators of different priorities.

- Adds parentheses to clarify the order of operations and reduce ambiguity.

## [readability-misleading-indentation](https://clang.llvm.org/extra/clang-tidy/checks/readability/misleading-indentation.html)

Detects misleading indentation that may cause confusion in code structure.

- Ensures proper indentation and braces to avoid hidden problems.

## [readability-misplaced-array-index](https://clang.llvm.org/extra/clang-tidy/checks/readability/misplaced-array-index.html)

Warns about unusual array index syntax that may cause confusion.

## [readability-non-const-parameter](https://clang.llvm.org/extra/clang-tidy/checks/readability/non-const-parameter.html)

Warns when pointer function parameters can be made `const` for safety.

- Suggests making pointer parameters `const` to avoid unintended modifications.
- Helps prevent errors and improves code readability by indicating non-modifiable data.

## [readability-qualified-auto](https://clang.llvm.org/extra/clang-tidy/checks/readability/qualified-auto.html)

Adds pointer qualifications to `auto` variables deduced as pointers.

- Ensures that pointer types are clearly indicated in `auto` declarations.
- Retains `const` and `volatile` qualifiers, improving code clarity and preventing confusion.

## [readability-redundant-casting](https://clang.llvm.org/extra/clang-tidy/checks/readability/redundant-casting.html)

Detects redundant type casts and recommends their removal.

- Eliminates unnecessary casting between identical types (e.g., `static_cast<int>(int)`).

## [readability-redundant-control-flow](https://clang.llvm.org/extra/clang-tidy/checks/readability/redundant-control-flow.html)

Detects redundant return and continue statements.

- Removes unnecessary `return` statements at the end of functions and redundant `continue` statements in loops.

## [readability-redundant-declaration](https://clang.llvm.org/extra/clang-tidy/checks/readability/redundant-declaration.html)

Finds and removes redundant variable and function declarations.

## [readability-redundant-inline-specifier](https://clang.llvm.org/extra/clang-tidy/checks/readability/redundant-inline-specifier.html)

Detects redundant `inline` specifiers on function and variable declarations.

## [readability-redundant-member-init](https://clang.llvm.org/extra/clang-tidy/checks/readability/redundant-member-init.html)

Finds unnecessary member initializations where the default constructor would be called.

- Detects redundant member initializations, such as explicitly initializing members to their default values.

## [readability-redundant-preprocessor](https://clang.llvm.org/extra/clang-tidy/checks/readability/redundant-preprocessor.html)

Finds potentially redundant `#preprocessor` directives.

- Detects redundant nested `#ifdef`, `#ifndef`, and `#if` pairs with identical conditions.

## [readability-redundant-smartptr-get](https://clang.llvm.org/extra/clang-tidy/checks/readability/redundant-smartptr-get.html)

Finds and removes redundant calls to smart pointer’s `.get()` method.

## [readability-redundant-string-cstr](https://clang.llvm.org/extra/clang-tidy/checks/readability/redundant-string-cstr.html)

Finds unnecessary calls to `std::string::c_str()` and `std::string::data()`.

## [readability-redundant-string-init](https://clang.llvm.org/extra/clang-tidy/checks/readability/redundant-string-init.html)

Finds unnecessary `string` initializations.

## [readability-reference-to-constructed-temporary](https://clang.llvm.org/extra/clang-tidy/checks/readability/reference-to-constructed-temporary.html)

Detects references used to extend the lifetime of temporary objects.

## [readability-simplify-boolean-expr](https://clang.llvm.org/extra/clang-tidy/checks/readability/simplify-boolean-expr.html)

Simplifies boolean expressions with constants or using DeMorgan’s Theorem

## [readability-simplify-subscript-expr](https://clang.llvm.org/extra/clang-tidy/checks/readability/simplify-subscript-expr.html)

Simplifies subscript expressions involving `.data()` and array subscripting.

- Detects expressions where `.data()` is followed by a subscript and simplifies it to use `operator[]` directly.

## [readability-static-accessed-through-instance](https://clang.llvm.org/extra/clang-tidy/checks/readability/static-accessed-through-instance.html)

Detects and replaces static members accessed through instances with qualified access.

- Replaces instance-based accesses to static members with the appropriate class name qualifier.

## [readability-static-definition-in-anonymous-namespace](https://clang.llvm.org/extra/clang-tidy/checks/readability/static-definition-in-anonymous-namespace.html)

Detects redundant static keyword usage in anonymous namespaces.

## [readability-string-compare](https://clang.llvm.org/extra/clang-tidy/checks/readability/string-compare.html)

Warns against using `std::string::compare` for equality/inequality checks.

- Use the equality `==` and inequality `!=` operators instead of `compare` for clarity and potentially better performance.

## [readability-use-std-min-max](https://clang.llvm.org/extra/clang-tidy/checks/readability/use-std-min-max.html)

Replaces conditionals with `std::min` or `std::max` for clarity.

- Replaces `if` statements with calls to `std::min` or `std::max` for readability, though it may impact performance in critical code.

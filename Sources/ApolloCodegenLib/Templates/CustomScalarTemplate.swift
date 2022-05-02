import Foundation

/// Provides the format to convert a [GraphQL Custom Scalar](https://spec.graphql.org/draft/#sec-Scalars.Custom-Scalars)
/// into Swift code.
struct CustomScalarTemplate: TemplateRenderer {
  /// IR representation of source [GraphQL Custom Scalar](https://spec.graphql.org/draft/#sec-Scalars.Custom-Scalars).
  let graphqlScalar: GraphQLScalarType

  var target: TemplateTarget { .schemaFile }

  var headerTemplate: TemplateString? {
    TemplateString(
    """
    // @generated
    // This file was automatically generated and can be edited to implement
    // advanced custom scalar functionality.
    //
    // Any changes to this file will not be overwritten by future
    // code generation execution.
    """
    )
  }

  var template: TemplateString {
    TemplateString(
    """
    public typealias \(graphqlScalar.name.firstUppercased) = String
    """
    )
  }
}
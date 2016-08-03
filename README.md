# SwiftAnnuity

A Swift library used to calculate annuities.

```swift
var annuity = SwiftAnnuity(
  principal: NSDecimalNumber(string: "250000"),
  rate: NSDecimalNumber(string: "0.035"),
  term: 15,
  frequency: 12
)
annuity.total
annuity.payment
```

It is possible to find the principal and the total amount from the payment
amount by using the payment initializer:

```swift
var annuity = SwiftAnnuity(
  payment: NSDecimalNumber(string: "1200"),
  rate: NSDecimalNumber(string: "0.035"),
  term: 15,
  frequency: 12
)
annuity.principal
annuity.total
```

It is also possible to find the principal and the payment amount from the total
amount paid for the annuity by using the total initializer:

```swift
var annuity = SwiftAnnuity(
  total: NSDecimalNumber(string: "400000"),
  rate: NSDecimalNumber(string: "0.035"),
  term: 15,
  frequency: 12
)
annuity.principal
annuity.payment
```

## Installation

To install to use within your project use Cocoapods and add the following to
your Podfile:

```
pod 'SwiftAnnuity', '~> 0.1.1'
```

## API

### `SwiftAnnuity(principal: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int = 1)`

Creates a new `SwiftAnnuity` object from the principal. Typically used to discover
the total and payment for the given interest rate over the term.

### `SwiftAnnuity(total: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int = 1)`

Creates a new `SwiftAnnuity` object from the total including interest over the term.
Can be used to discover the principal by reversing the calculation.

### `SwiftAnnuity(payment: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int = 1)`

Creates a new `SwiftAnnuity` object from the fixed payment. Can be used to discover
the principal by reversing the calculation.

### `annuity.rate: NSDecimalNumber`

Returns the rate for the `SwiftAnnuity` instance.

### `annuity.term: Int`

Returns the term for the `SwiftAnnuity` instance.

### `annuity.frequency`

Returns the frequency for the `SwiftAnnuity` instance.

### `annuity.principal`

Returns the principal for the `SwiftAnnuity` instance.

### `annuity.total`

Returns the total including interest for the `SwiftAnnuity` instance.

### `annuity.payment`

Returns the payment amount for the `SwiftAnnuity` instance.


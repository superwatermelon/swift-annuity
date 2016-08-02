# SwiftAnnuity

A Swift library used to calculate annuities.

```swift
var annuity = Annuity(
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
var annuity = Annuity(
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
var annuity = Annuity(
  total: NSDecimalNumber(string: "400000"),
  rate: NSDecimalNumber(string: "0.035"),
  term: 15,
  frequency: 12
)
annuity.principal
annuity.payment
```

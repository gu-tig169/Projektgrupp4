# Crypto296 - Projektgrupp 4

_Track your favorite cryptocurrencies with style._

---

## 1. Overview

### 1.1 UI

#### 1.1.1 Global widgets

#### 1.1.2 Screens

### 1.2 Model & States

* **Currency**

```dart
Currency(
      {@required this.name,
      @required this.symbol,
      @required this.priceUsd,
      @required this.priceBtc,
      @required this.lastUpdated,
      @required this.percentChange24hUsd,
      this.isFavorite = false,
      this.hasUpperThreshold = false,
      this.upperThreshold,
      this.hasLowerThreshold = false,
      this.lowerThreshold});
```

* **Currencies**

### 1.3 API / Cloud storage

* **Shrimpy**
  * API to get current cryptocurrency market data.
* **Firebase**
  * Cloud storage for user (key) specific favorites annd thresholds.
* **SaveApi**
  * Generic function to integrate with API (json)

```dart
static void saveCurrencies(List<Currency> currencies) async {
    List json =
        List.generate(currencies.length, (index) => currencies[index].toJson());

    await http.post(
      _url,
      body: jsonEncode(json),
      headers: {'Content-Type': 'application/json'},
    );
  }
```

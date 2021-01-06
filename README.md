# Crypto296 - Projektgrupp 4

_Track your favorite cryptocurrencies with style._

---

## 1. Overview

### 1.1 UI

#### 1.1.1 Global widgets

Widgets meant to be used by more than one specific screen or class.

#### 1.1.2 Screens

The full or semi-full screen widgets used by either the Navigator or the TabView.

### 1.2 Model & States

* **Currency**

A model representing a cryptocurrency.

```dart
Currency({
      @required this.name,
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

A state provider that keeps track of current currencies and methods associated with them.

### 1.3 API / Cloud storage

* **Shrimpy**
  * API to get current cryptocurrency market data.
* **Firebase**
  * Cloud storage for user (key) specific favorites and thresholds.
  * Android only atm
* **SaveApi**
  * Generic function to integrate with API (json)
  * Not connected to API

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

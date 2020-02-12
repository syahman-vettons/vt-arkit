# vt-arkit

## Getting started

`$ npm install vt-arkit --save`
or
`$ yarn add vt-arkit`

### Mostly automatic installation

`$ react-native link vt-arkit`

## Usage
```javascript
import ARView from 'vt-arkit';

// Check if AR is supported
ARView.isARSupported()

// Display the usdz model in ARQuickLook
ARView.display(MODEL_URL);
```

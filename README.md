# vt-arkit

### Version 1.0.2
vt-arkit is an ARKit module for VT. Uses ARQuickLook to display the USDZ file in Augmented Reality. This module does not handle the downloading of the 3D file.

## Getting started

`$ npm install https://github.com/syahman-vettons/vt-arkit --save`
or
`$ yarn add https://github.com/syahman-vettons/vt-arkit`

### Mostly automatic installation 

`$ react-native link vt-arkit`

### Pod install. Required

`$ cd ios && pod install`


## Usage
```javascript
import ARView from 'vt-arkit';

// Absolute path to the USDZ file
let path = '/var/mobile/Containers/Data/Application/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXXX/Library/Caches/ARModel/toy_car.usdz'

// URL of the 3D Model File to download (Experimental)
let remoteURL = 'https://developer.apple.com/augmented-reality/quick-look/models/vintagerobot2k/toy_robot_vintage.usdz'

/** Check if AR supported from Native
*@returns `{supported: Boolean, message: String}`
*/
ARView.nativeARCheck()

/** Display the USDZ model in ARQuickLook with path as parameter
* @param {*} path Absolute path to the 3D Model file
*/
ARView.display(path);

/** Download natively and Display the AR (Experimental)
 * @param {*} remoteURL URL of the 3D Model File
 */
ARView.instantGo(remoteURL);

/** Method to set allowsContentScaling
 * @param {*} bool True of False
 */
ARView.allowsContentScaling(bool);

/** Method to set canonicalWebPageURL
 * @param {*} url URL to share
 */
ARView.canonicalWebPageURL(url);

```

import { NativeModules, Alert } from 'react-native';

const NativeARView = NativeModules.ARView;

export default class ARView {
    /** Check if AR supported from Native
    *@returns `{supported: Boolean, message: String}`
    */
    static nativeARCheck(){
      return new Promise(resolve => {
        NativeARView.isARSupported(val => resolve(val));
      });
    }
  
    /** Async method to check if AR is supported
     * @returns `true` if supported. Will return `false` and an `Alert` if not supported.
     */
    static async isARSupported() {
      const nativeCheck = await this.nativeARCheck();
  
      if (nativeCheck.supported) {
        return true;
      } else {
        Alert.alert('Not Supported', nativeCheck.message);
        return false;
      }
    }
    /** Display the AR Session with path as parameter
     * @param {*} path Absolute path to the 3D Model file
     */
    static display(path){
      NativeARView.display(path);
    }

    /** Download natively and Display the AR (Experimental)
     * @param {*} remoteURL URL of the 3D Model File
     */
    static instantGo(remoteURL){
      NativeARView.downloadFileAndGo(remoteURL);
    }

    /** Method to set allowsContentScaling
     * @param {*} bool True of False
     */
    static allowsContentScaling(bool){
      NativeARView.allowsContentScaling(bool);
    }

    /** Method to set canonicalWebPageURL
     * @param {*} url URL to share
     */
    static canonicalWebPageURL(url){
      NativeARView.canonicalWebPageURL(url);
    }
  }
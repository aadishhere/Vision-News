# Vision News

![Welcome Screen Screenshot](https://github.com/user-attachments/assets/242da3f2-e29f-4c9e-9ee1-3b86ece2b03e)
![Image Scanning Screenshot](https://github.com/user-attachments/assets/ddb36292-0f35-49d7-8ce2-9f5e761ba679)
![Video Playback Screenshot](https://github.com/user-attachments/assets/a10a7842-d09a-48ae-b85b-f3894b911001)

An experimental iOS Augmented Reality application using ARKit to bring static news images to life by overlaying related video content. Developed as a personal project to explore and understand the capabilities of image tracking and video integration within AR experiences.

## Project Purpose

* Personal exploration and learning of Apple's ARKit framework, specifically focusing on image tracking and augmented reality content rendering.
* Experimenting with overlaying dynamic media (video) onto static real-world images.
* Building a tangible project to understand the AR development pipeline on iOS.

## Status

Working (Based on existing README)

## Features / App Flow

The app guides the user through a specific flow to experience the augmented reality news:

1.  **Welcome Screen:**
    * **Description:** Features a modern layout introducing users to Vision News. It includes a brief description and a “Get Started” button.
    * *(Existing Screenshot(s) relevant to Welcome Screen)*

2.  **Image Scanning View:**
    * **Description:** Displays a live camera feed with a focus guide. When a pre-defined image (like a news article image) is detected, an overlay animation indicates successful recognition.
    * *(Existing Screenshot(s) relevant to Image Scanning View)*

3.  **Video Playback View (Augmented Reality):**
    * **Description:** Renders the recognized video on an AR plane that is anchored to the detected image in the real world. Users can play, pause, or replay the video via interactive controls.
    * *(Existing Screenshot(s) relevant to Video Playback View)*

*(Add descriptions and screenshots for any other screens or significant parts, e.g., the Menu)*

## Technologies Used

* **iOS:** The target operating system.
* **UIKit:** The primary framework used for building the user interface and managing views.
* **ARKit:** Apple's framework for building augmented reality experiences.
* **SceneKit:** Used for rendering 3D content (the plane onto which the video is projected) in the AR environment.
* **SpriteKit:** Used to display the video content (`SKVideoNode`) which is then applied as a texture in SceneKit.

## Implementation Notes

* Uses `ARImageTrackingConfiguration` to detect specific reference images (`NewsImages` asset catalog group).
* When an image is detected (`renderer(_:nodeFor:)`), an `ARImageAnchor` is created.
* An `SCNPlane` (a flat 3D surface) is created with the same physical dimensions as the detected image.
* An `SKVideoNode` from SpriteKit is used to load and play the corresponding video file (named after the image).
* The `SKVideoNode`'s `SKScene` is set as the `diffuse.contents` of the `SCNPlane`'s material.
* The `SCNPlane` is added as a child node to the `ARImageAnchor`'s node, positioning it in the AR space on top of the detected image.

## Note on Privacy

This is a personal project repository and is not intended for public use, distribution, or external contributions. The code is here for my own reference and documentation.

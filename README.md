# SwiftUI MVVM - Blueprint

## Why?
This is a complete swiftUI starter project with MVVM architecture and a folder-by-feature structure. It can be cloned and used as a project template
or a project quickstart for experimentation and/or prototyping a PoC.

## Modules
### App
Has the core business logic in it, with the definition of the views, models, viewmodels.

### API
Isolated layer that implements the data access
#### DTO
Contains `Codable` compatible structs that will be used to translate data gathered from api

#### Network
Contains the actual implementation to consume data from the backend

## Backend
This project makes use of the open API of https://www.tabnews.com.br a brazilian, [open source](https://github.com/filipedeschamps/tabnews.com.br), 
reddit-like, news/critique sharing/discussion board by @filipedeschamps.


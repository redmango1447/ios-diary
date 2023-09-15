# 🎬 Diary
![image](https://github.com/redmango1447/ios-diary/assets/79740398/2f6d1386-6501-44da-b715-5cd884a9e258)

> 프로젝트 기간 23/08/28 ~ 23/09/15

## 📖 목차
1. [소개](#🍀-소개)
2. [팀원](#👨‍💻-팀원)
3. [타임라인](#⏰-타임라인)
4. [시각화된 프로젝트 구조](#👀-시각화된-프로젝트-구조)
5. [실행 화면](#💻-실행-화면)
6. [트러블 슈팅](#🧨-트러블-슈팅)
7. [참고 링크](#📚-참고-링크)

</br>

## 🍀 소개

일기장을 읽고 쓰고 수정하고 삭제할 수 있습니다. 
모든 행위는 CoreData를 통해 영구저장됩니다. 
일기를 작성했던 날짜를 기반으로 OpenWeather의 API를 이용해 날씨 아이콘을 일기 목록에 추가합니다. 
일기를 작성하면서 나가거나 백그라운드로 이동하거나 키보드를 내리면 여태 작성했던 내용을 영구 저장합니다. 
따라서 실수로 내용이 날라가버리는 일은 일어나지 않습니다. 


</br>

## 👨‍💻 팀원

| redmango | Minsup |
| :--------: | :--------: |
|<Img src="https://hackmd.io/_uploads/HJ2D-DoNn.png" width="200"> | <Img src = "https://github.com/redmango1447/ios-diary/assets/79740398/3f453281-a6c7-4299-a533-ccc31d86f5b0" width="200" height="200"> | 
|[Github Profile](https://github.com/redmango1447) |[Github Profile]() |

</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.08.28| - Swift Lint 적용, DiaryDTO 추가 및 샘플 Json 추가|
|2023.08.29| - CompositionalLayout를 이용한 UICollectionView구현 <br> - UICollectionViewListCell 구현|
|2023.08.30| - DiaryView 구현|
|2023.09.01| - README 작성 및 수정사항 반영|
|2023.09.04| - CoreData의 컨테이너 객체 생성 및 전달|
|2023.09.07| - 새 일기 생성 기능 구현|
|2023.09.11| - background 진입 시 저장 구현|
|2023.09.14| - CLLocationManager를 이용해 현재 위치를 기반으로 날씨아이콘을 가져오는 기능 구현|
|2023.09.15| - 코드 정리 및 README 작성|

</br>

## 👀 시각화된 프로젝트 구조

추후 추가예정
    
### ℹ️ File Tree
<details>
   <summary>파일구조</summary>
    
![image](https://github.com/redmango1447/ios-diary/assets/79740398/9774c7f3-95c8-476d-a04d-cd45f488b634)

    
</details>


### 📐 Diagram

![image](https://github.com/redmango1447/ios-diary/assets/79740398/12c5a377-63c9-4763-84d3-8b1d94c99e69)



</br>

## 💻 실행 화면 

|   읽기 | 쓰기 | 수정 | 삭제 |
|:---:| :---: | :---: |:---:|
|![일기장 읽기](https://github.com/redmango1447/ios-diary/assets/79740398/e375010a-2644-4bd8-8eba-f14a60c95ec0)| ![일기장 쓰기](https://github.com/redmango1447/ios-diary/assets/79740398/c1d9085b-5d3a-42db-a7f3-80486df5dd3a) | ![일기장 수정](https://github.com/redmango1447/ios-diary/assets/79740398/7669176e-7fce-49d4-80de-6c95ece45fa8) | ![일기장 삭제 압축](https://github.com/redmango1447/ios-diary/assets/79740398/9ac419f2-b304-4a01-a6a7-f58274a1c54a)






</br>

## 🧨 트러블 슈팅

1️⃣ **ContentView** <br>
-
🔒 **🧐문제점🧐** <br>
cell의 크기가 44로 고정되어 어떻게 해도 cell의 크기가 변하지 않고 오히려 내부의 컨텐츠들이 잘려서 출력되는 문제점이 발견되었습니다.
    
🔑 **😆해결방법😆** <br>
알고보니 기존에 stackView를 contentView가 아닌 view에 add하고 
stackView 레이아웃을 잡을 때 view에 걸어주었기 때문에 cell이 stackView 사이즈에 맞게 커지지 않는 거였습니다.

stackView를 cell의 contentView에 add하고 레이아웃을 contentView에 잡아줌으로서 문제를 해결할 수 있었습니다.

```swift
contentView.addSubview(view)

NSLayoutConstraints.activate([ 
    view.topAnchor.constraint(equalTo: contentView.topAnchor)
])
```
<br>

2️⃣ **로케일** <br>
-
🔒 **🧐문제점🧐** <br>
Locale.current는 사용자의 기기의 현재 위치와 언어를 가져올 수 있는 API입니다.
하지만 이 current를 이용해 Date를 표시하려고 했지만 계속 영어가 나왔습니다.
아무리 설정을 확인해보고 변경을 해봤지만 해결되지 않았습니다.

🔑 **😆해결방법😆** <br>
앱이 한국어를 지원안하기 때문에 생긴 문제였습니다.
프로젝트 설정에서 한국어를 지원하면 Locale.current가 잘 작동하는 것을 확인할 수 있습니다.

<br>


</br>

## 📚 참고 링크
- [LocationManager](https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/1423615-locationmanager)
- [Using Lightweight Migration](https://developer.apple.com/documentation/coredata/migrating_your_data_model_automatically)
- [CoreData](https://developer.apple.com/documentation/coredata)
- [UISwipeActionsConfiguration](https://developer.apple.com/documentation/uikit/uiswipeactionsconfiguration)

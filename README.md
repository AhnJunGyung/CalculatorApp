# 📱iOS 계산기 앱 만들기

<img src="https://velog.velcdn.com/images/ekdlrkzm/post/c304924c-8c56-4b6c-87d6-2a8719580154/image.webp">

## 📖 목차
1. [프로젝트 소개](#프로젝트-소개)
2. [프로젝트 계기](#프로젝트-계기)
4. [주요기능](#주요기능)
5. [개발기간](#개발기간)
6. [기술스택](#기술스택)
7. [Language](#Language)
8. [Trouble Shooting](#trouble-shooting)
    
## 👨‍🏫 프로젝트 소개
이전에 Playground에서 로직만 구현했던 계산기를 UIKit을 사용해 앱으로 구현하고자 했습니다. 해당 과제에서는 정수형 계산만을 다루는 약식 계산기로 구현하였습니다.

## 프로젝트 계기
스파르타코딩클럽에서 iOS를 수강 중 앱개발 입문 주차에 과제로 부여받은 개인프로젝트입니다.


## 주요기능

- 계산 수식 입력 : 탭된 버튼에 맞게 수식이 입력됩니다. 잘못 된 숫자입력`(ex. 03 + 05)`이나 잘못된 연산기호`(ex. 5++3-/)`은 입력되지 않습니다.

- 계산 결과 출력 : `=`버튼을 탭하면 정수형 계산 결과를 출력합니다.

## ⏲️ 개발기간
- 2024.11.14(목) ~ 2024.11.19(화)

## 📚️ 기술스택
<img src="https://img.shields.io/badge/Xcode-147EFB?style=flat-square&logo=Xcode&logoColor=white"/>


### ✔️ Language 
<img src="https://img.shields.io/badge/Swift-F05138?style=flat-square&logo=Swift&logoColor=white"/>

## Trouble Shooting

![](https://velog.velcdn.com/images/ekdlrkzm/post/1f8ccbc2-642f-4b31-8553-c35277aa95bb/image.png)
- UI구현 중 스택뷰 오류 : `verticalStackView`에 `horizontalStackView`를 쌓는 과정에서 위와같은 오류를 계속 발생시켜 해결하는데 시간을 많이 소비했습니다.
찾아본 결과 `제약조건`이 문제가 되었는데, `verticalStackView의 높이`가 horizontalStackView의 높이를 담을 만큼 충분하지 않아 스택이 겹치게 되어 오류가 발생했었습니다.
`verticalStackView`의 height를 4개의 horizontalStackView의 높이와 spacing값을 더한 값으로 수정하여 해결하였습니다.
처음에 문제에서 주어진 스택뷰에 대한 정보가 앱을 완전히 구현할때 까지 유지되는 값이라는 생각이 머리속에 박혀있었는지 원인을 찾는데 시간이 더 오래걸렸던 것 같습니다.😅

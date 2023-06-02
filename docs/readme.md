## Git commit convention

- [Feat] : 새로운 기능
- [Fix] : 오류 수정
- [Refac] : 리팩토링
- [Docs] : 문서/주석 수정
- [Test] : 테스트 코드 작성 및 수정
- [Minor] : 자잘한 UI 수정 및 코드 정리
- [Other] : 기타 작업

- 두 줄 띄고 상세사항/남은사항 본문으로 작성

## Design pattern

##### UI: Atomic 디자인패턴을 변형하여 적용해 UI 컴포넌트를 atom, module, page로 구분했다.

- atom: 전 페이지에서 재사용가능한 최소 단위의 컴포넌트를 정의한다.

- module: atom과 다른 module을 조합해 정보 집합을 만든다.

- page: atom과 module을 조합하고 레이아웃을 지정한다.

##### Clean Architecture 적용

- 3계층 구조: Data, Domain, Presentation
1. Data: Repository 패턴을 이용하여 서버와 DB 접근을 추상화한다. 서버 스키마 매핑을 위한 DTO도 포함된다.
2. Domain: 의존을 위한 Repository interface와 UseCase가 포함된다. UseCase는 Repository를 조합해 유저 시나리오에 따른 흐름을 구성한다.
3. Presentation: View(UI)와 ViewModel으로 구성된다. View에서 ViewModel을 주입받고 ViewModel에서 UseCase를 호출하여 View에 바인딩된 변수를 변경한다.


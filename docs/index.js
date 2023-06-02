let topBtnToggle = false;

// ****** 배너 및 컨텐츠 스크롤 애니메이션 ********* //
const fadeinAnimation = [
  { transform: "translateY(80px)", opacity: 0 },
  { transform: "translateY(0px)", opacity: 1 },
];

const fadeinTiming = {
  duration: 1000,
  iterations: 1,
  easing: "ease-in-out",
  // fill: "forwards",
};

const cards = document.querySelectorAll(".card");

const cardList = []; // 왜 다시 담는진 모르겠음 과거의 나에게 물어보고싶다
const cardIsAnimate = []; // 한번 애니메이션 된건 실행 X false가 실행이전
for (let i = 0; i < cards.length; i++) {
  cardList.push(cards[i]);
  cardIsAnimate.push(false);
  cardList[i].style.opacity = 0;
}

// 요소 절대 좌표 구하기
var elementsTop = cardList.map(
  (item) => window.pageYOffset + item.getBoundingClientRect().top
);
console.log(elementsTop);

// 스크롤 아래쪽이 요소 위쪽과 닿으면 실행 (실제론 스크롤이 좀 더 요소 내로 들어간 후에)
const scrollEvent = () => {
  var scrollBottom = document.documentElement.scrollTop + window.screen.height;

  elementsTop.forEach((elementTop, idx) => {
    // 스크롤 바텀이 요소보다 커지면 지나간 것 -> 애니메이션 실행
    // 첫 실행 이후 중복실행되지 않도록 true 설정
    if (
      scrollBottom - window.screen.height / 2 > elementTop &&
      cardIsAnimate[idx] == false
    ) {
        // console.log(scrollBottom);
        // console.log(`${idx}, ${elementTop}`)
      cardList[idx].animate(fadeinAnimation, fadeinTiming);
      cardList[idx].style.opacity = 1;
      cardIsAnimate[idx] = true;
    }

  });

  // 맨 위로 올라가면 fade in 다시 실행되도록 배열 초기화 50은 오차범위
  if (scrollBottom < window.screen.height) {
    cardIsAnimate.map((item, idx) => {
      cardIsAnimate[idx] = false;
      cardList[idx].style.opacity = 0;
    });
  }

  if (document.documentElement.scrollTop == 0) {
    if (topBtnToggle == true) {
      downTopBtn();
      topBtnToggle = false;
    }
  } else {
    if (topBtnToggle == false) {
      upTopBtn();
      topBtnToggle = true;
    }
  }
};

// ****** 맨 위로 버튼 애니메이션 ********* //
const upTopBtn = () => {
  const topBtn = document.querySelector(".top-button");
  topBtn.animate(
    [
      { transform: "translateY(100px)", opacity: 1 },
      { transform: "translateY(0px)", opacity: 1 },
    ],
    {
      duration: 500,
      iterations: 1,
      fill: "forwards",
      easing: "ease-in-out",
    }
  );
};

const downTopBtn = () => {
  const topBtn = document.querySelector(".top-button");
  topBtn.animate(
    [
      { transform: "translateY(0px)", opacity: 1 },
      { transform: "translateY(100px)", opacity: 1 },
    ],
    {
      duration: 500,
      iterations: 1,
      fill: "forwards",
    }
  );
};

// ****** 스크롤 이벤트 ********* //
window.addEventListener("scroll", scrollEvent);

// ****** 첫 로드 이벤트 ********* //
window.onload = () => {
  const bannerImage = document.querySelector(".banner-img");
  bannerImage.animate(fadeinAnimation, fadeinTiming);

  const bannerIcon = document.querySelector(".banner-icon");
  bannerIcon.animate(infiniteUpandDownAnimation, infiniteTiming);

  downTopBtn();

  bannerIconAnimation();
};

// ****** 배너 아이콘 위아래 애니메이션 ********* //
const bannerIconAnimation = () => {};

const infiniteUpandDownAnimation = [
  { transform: "translateY(30px)" },
  { transform: "translateY(0px)" },
  { transform: "translateY(30px)" },
];

const infiniteTiming = {
  duration: 8000,
  iterations: 50,
  easing: "ease",
};

import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById("banner-typed-text")) {
    new Typed('#banner-typed-text', {
      strings: ["Bairbnb", "Explore the world"],
      typeSpeed: 50,
      loop: true
    });
  }
};

export { loadDynamicBannerText };

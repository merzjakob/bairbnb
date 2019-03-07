import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Bairbnb", "Explore the world"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };

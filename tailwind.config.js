/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{res,js}", "./index.html"],
  theme: {
    extend: {
      fontFamily: {
        "indie-flower": ["Indie Flower", "cursive"],
      },
      keyframes: {
        fadeIn50: {
          "0%": {
            opacity: 0,
          },
          "100%": {
            opacity: 0.5,
          },
        },
        zoom: {
          "0%": {
            transform: "scale3d(0, 0, 0)",
          },
          "90%": {
            transform: "scale3d(1.1, 1.1, 1.1)",
          },
          "100%": {
            transform: "scale3d(1, 1, 1)",
          },
        },
      },
      animation: {
        fadeIn50: "fadeIn50 1s linear",
        zoom: "zoom 0.5s ease-in-out",
      },
    },
  },
  plugins: [],
};

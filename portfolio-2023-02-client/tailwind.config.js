/** @type {import('tailwindcss').Config} */

module.exports = {
    content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
    "./src/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
    screens: {
      'tablet-potrt-up': '600px',
      'sm': '640px',
      'md': '768px',
      'tablet-landscp-up': '900px',
      'lg': '1024px',
      'desktop-up': '1200px',
      'xl': '1280px',
      '2xl': '1536px',
      'big-desktop-up': '1800px'
    }
  },
  plugins: [],
}

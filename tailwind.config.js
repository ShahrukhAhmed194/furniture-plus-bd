/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: false, // or 'media' or 'class'
  content: [
    "./resources/views/front/**/*.blade.php",
    "./resources/views/vendor/pagination/tailwind.blade.php",
    "./node_modules/tw-elements/dist/js/**/*.js"
  ],
  theme: {
    extend: {
      container: {
        center: true,
        padding: {
          DEFAULT: '1rem',
          sm: '2rem',
          lg: '4rem',
          xl: '5rem',
          '2xl': '6rem',
        },
      },
      colors: {
        'primary': 'var(--primary)',
        'primary-light': 'var(--primary_light)',
        'secondary': 'var(--secondary)',
        'secondary-dark': 'var(--secondary_dark)',
        'customer-color': '#05ad05',
      }
    },
  },
  plugins: [
    require('tw-elements/dist/plugin'),
    function ({ addComponents }) {
      addComponents({
        '.container': {
          maxWidth: '100%',
          '@screen sm': {
            maxWidth: '576px',
          },
          '@screen md': {
            maxWidth: '768px',
          },
          '@screen lg': {
            maxWidth: '1050px',
          },
          '@screen xl': {
            maxWidth: '1700px',
          },
        }
      })
    }
  ],
}

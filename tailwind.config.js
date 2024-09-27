const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        dark: '#1E1E1E',
        darkGray: '#333333',
        mediumGray: '#555555',
        green: '#4CAF50', // Renamed 'green' to avoid conflicts
        white: '#FFFFFF',
        red: '#F44336',
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
}


const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  darkMode: 'class',
  content: [
    './index.html',
    './src/**/*.{vue,js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['"IBM Plex Sans"', ...defaultTheme.fontFamily.sans],
        serif: ['"Roboto Serif"', ...defaultTheme.fontFamily.serif],
        mono: ['"DM Mono"', ...defaultTheme.fontFamily.mono],
      },
      colors: {
        light: '#E8E8E8',
        dark: '#292929',
      },
      transitionTimingFunction: {
        'in-expo': 'cubic-bezier(0.95, 0.05, 0.795, 0.035)',
        'out-expo': 'cubic-bezier(0.19, 1, 0.22, 1)',
      },
      strokeWidth: {
        10: '10px',
        15: '15px',
        20: '20px',
      },
    },
  },
  plugins: [],
}

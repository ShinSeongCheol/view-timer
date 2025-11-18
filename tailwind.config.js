/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "./app/**/*.{ts,tsx}",
        "./pages/**/*.{ts,tsx}",
        "./widgets/**/*.{ts,tsx}",
        "./features/**/*.{ts,tsx}",
        "./entities/**/*.{ts,tsx}",
        "./shared/**/*.{ts,tsx}",
    ],
    presets: [require('nativewind/preset')],
    theme: {
        extend: {},
    },
    plugins: [],
}


<script setup lang="ts">
useHead({
  title: 'Vinícius Philot - Work',
  meta: [
    { name: 'description', content: 'Vinícius Philot is a Front-end UI developer' },
  ],
})
</script>

<template>
  <div class="w-full md:w-2/3 text-lg tracking-wide leading-relaxed">
    <section>
      <h1 class="text-4xl md:text-7xl tracking-wide mb-8 font-sans bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-green-600 dark:from-blue-500 dark:to-green-400">
        Currently: Lead Front-end Developer at
        <Link title="Creative Layer" url="https://www.creativelayer.com/" class="" :dashed="false">
          <!-- Safari hack -->
          <span class="bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-green-600 dark:from-blue-500 dark:to-green-400">
            Creative Layer
          </span>
        </Link>
      </h1>
      <p class="mb-4">
        I joined CL in early 2021 as a remote engineer, working from Toronto with an amazing team of developers located all over Ontario. We build tools to empower creators by giving them access to new revenue streams.
      </p>
      <p class="mb-4">
        Our first platform, <em>Workflow</em>, focused on the print-on-demand market by making it easy for merchants and artists to communicate, review, and ship their work.
      </p>
      <p>
        We are now tapping into the Web3 space with <em> <Link title="Remx" url="https://remx.xyz/">
          Remx
        </Link></em>, a digital creative community focused on art, culture, & identity.
      </p>
    </section>
    <DividerY />

    <section>
      <div class="flex items-center space-x-4 mb-4">
        <h1 class="text-3xl md:text-4xl font-thin tracking-wide font-sans">
          Prev: Front-end Software Developer at Cineplex
        </h1>
      </div>
      <ul class="pl-4 list-disc">
        <li>Worked with a team of developers and designers implementing a Front End modernization project from .NET MVC to Jamstack (Next.js and React)</li>
        <li>Delivered AODA / WCAG compliant solutions inside Cineplex, CineplexStore, and TheRecRoom</li>
        <li>Built web components using vanilla JavaScript, React, and Vue</li>
        <li>Transformed inline layouts into modularized templates, decoupling data and views using a headless CMS</li>
      </ul>
    </section>
    <DividerY />

    <section>
      <p>
        If we're going <em>vintage</em> <Link url="/docs/2023-viniciusphilot-resume.pdf" download>
          you can download my résume here
        </Link>
      </p>
    </section>
    <DividerY />
  </div>
</template>

---
layout: base
title: MySTL
---



{% assign natural_files = site.static_files %}
{% for asset in natural_files %}
  {% assign ext = asset.extname | lower %}
  {% assign parts = asset.path | split: "/" %}
  {% assign dirname = parts[1] %}
  {% if asset.force_image or dirname == "resources" %}
  {% if asset.force_image or ext == ".jpg" or ext == ".png" %}
![{{ asset.title }}]({{ asset.path }})
  {% endif %}
  {% endif %}
{% endfor %}

{% comment %}
Sections to consider adding:
# How I made this
# Print Settings
# Remixed from
{% endcomment %}

## Downloads

{% for asset in natural_files %}
  {% assign ext = asset.extname | lower %}
  {% assign parts = asset.path | split: "/" %}
  {% assign dirname = parts[1] %}
  {% if asset.force_download or dirname == "resources" %}
  {% if asset.force_download or ext == ".stl" or ext == ".scad" or ext == ".zip" %}
  {% assign basename = asset.path | split: "/" | last %}
  - [{{ asset.title | default: basename }}]({{ asset.path }})
  {% endif %}
  {% endif %}
{% endfor %}



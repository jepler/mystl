---
layout: base
title: MySTL
---



{% for asset in site.data.assets %}
  {% for image in asset.images %}
  {% if asset.stl %}
<img src="{{ relative }}resources/{{ image }}" title="{{ asset.name }}" data-stl="{{ relative }}resources/{{ asset.stl }}">
  {% else %}
<img src="{{ relative }}resources/{{ image }}" title="{{ asset.name }}">
  {% endif %}
  {% endfor %}
{% endfor %}

{% comment %}
Sections to consider adding:
# How I made this
# Print Settings
# Remixed from
{% endcomment %}

## Downloads

{% for asset in site.data.assets %}
  - {{ asset.name }}:
  {% if asset.scad %}
  {% assign basename = asset.scad | split: "/" | last %}
    - [{{ basename }}](resources/{{ asset.scad }})
  {% endif %}
  {% if asset.stl %} 
    {% assign basename = asset.stl | split: "/" | last %}
    - [{{ basename }}](resources/{{ asset.stl }})
    {% endif %}
  {% if asset.svg %} 
    {% assign basename = asset.svg | split: "/" | last %}
    - [{{ asset.name }} - {{ basename }}](resources/{{ asset.svg }})
    {% endif %}
  {% if asset.flags %} 
      Generated with `{{ asset.flags }}`
  {% endif %}
{% endfor %}



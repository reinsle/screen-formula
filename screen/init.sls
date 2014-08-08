{% from "screen/map.jinja" import screen with context %}

screen:
  pkg:
    - installed
    - name: {{ screen.pkg }}

/etc/screenrc:
  file.managed:
    - name: {{ screen.screenrc}}
    - source: {{ salt['pillar.get']('screen:screenrc_src', 'salt://screen/files/screenrc') }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: {{ screen.pkg }}


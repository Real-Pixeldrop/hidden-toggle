# Hidden Toggle

Affiche ou masque les fichiers cachés dans le Finder en un clic. Simple, rapide, pas de setup. Menu bar macOS.

## Download

[Télécharger HiddenToggle.zip](https://github.com/Real-Pixeldrop/hidden-toggle/releases/latest/download/HiddenToggle.zip)

1. Télécharge le zip
2. Dézipe
3. Glisse dans Applications
4. Double-clic. C'est prêt.

## Comment ça marche

1. **Clique** sur l'icône Hidden Toggle dans la menu bar
2. **Toggle** : les fichiers cachés apparaissent/disparaissent dans le Finder
3. C'est tout. Pas de config, pas de terminal.

## From source

```bash
git clone https://github.com/Real-Pixeldrop/hidden-toggle.git
cd hidden-toggle
swift build -c release
cp -r .build/release/HiddenToggle.app /Applications/ 2>/dev/null || \
  cp .build/release/HiddenToggle /Applications/
```

## One-liner install

```bash
curl -sL https://github.com/Real-Pixeldrop/hidden-toggle/releases/latest/download/HiddenToggle.zip -o /tmp/ht.zip && unzip -o /tmp/ht.zip -d /Applications/ && xattr -cr /Applications/HiddenToggle.app && open /Applications/HiddenToggle.app
```

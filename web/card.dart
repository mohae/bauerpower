part of bauer_power;

class Card extends TokenSprite {
  final num suit;
  final num number;
  final nun color;
  
  bool _faceDown;
  
  Card(this.color, this.number, this.suit) {
    cursor = "pointer";
    
    faceUp();
  }
  
  bool get isFaceDown => _faceDown;
  
  Image get spriteSheet => isFaceDown ? _settings.backImage : _settings.frontImage;
  
  void faceDown() {
    _faceDown = true;
    
    ox = 0;
    oy = 0;
  }
  
  void faceUp() {
    _faceDown = false;
    
    ox = (number - 1) * ow;
    oy = suit * oh;
  }
}

class Drag {
  final Card card;
  
  final num _rx;
  final num _ry;
  final num _z;
  
  final num _offsetX;
  final num _offsetY;
  
  Drag(Card card, int x, int y)
      : this.card = card,
        _rx = card.rx,
        _ry = card.ry,
        _z = card.z,
        _offsetX = x - card.x,
        _offsetU = y - card.y {
    
      card.z += 100;
  }
  
  void moveTo(int x, int y) {
    card.moveTo((x - _offsetX) / _canvas.width, (y - _offsetU) / _canvas.height);
  }
  
  void cancel() {
    card.rx = _rx;
    card.ry = _ry;
    card.z = _z;
  }
}

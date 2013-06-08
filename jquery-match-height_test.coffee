describe "MatchHeight", ->
  
  beforeEach ->
    html = """
      <div class="js-target js-target-shorter">
        <p>Some placeholder content</p>
      </div>
      <div class="js-target js-target-taller">
        <p>Some placeholder content</p>
      </div>
      <div class="js-outside-target">
        <p>Some placeholder content</p>
      </div>
    """
 
    @markup = $(html).appendTo("body")
    $(".js-target-taller").height(800)
    $(".js-outside-target").height(5000)
    $(".js-target").matchHeight()
  
  afterEach ->
    @markup.remove()
 
  it "should set the correct height on the target", ->
    expect($(".js-target-shorter").height()).toBe 800
 
  it "should take padding into account", ->
    $(".js-height-source").css("padding", "50px")
    $(window).trigger "resize"
    expect($(".js-target").height()).toBe 800
 
  it "should allow you to target a specific outside element", -> 
    $(".js-target").matchHeight {$specificTarget: $(".js-outside-target")}
    expect($(".js-target").height()).toBe 5000
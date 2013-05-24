class MainScreen < ProMotion::Screen
  title "Home"

  def on_load
    self.stylesheet = :main
    self.view.stylename = :root
  end

  def will_appear
    @label = UILabel.alloc.initWithFrame [[20,20],[280,44]]
    @label.text = ""
    view.addSubview @label

    getUid
  end

  def on_appear
    BW::HTTP.get("http://localhost:3000/users.json") do |rep|
      result_data = BW::JSON.parse(rep.body.to_str)
      @label.text = result_data[0]['uid']
    end

  end

  def getUid
    #Faire requete sur bdd

    @uid = App::Persistence['uid']
    @uid = App::Persistence['uid'] = BubbleWrap.create_uuid  if @uid.nil?
  end
end
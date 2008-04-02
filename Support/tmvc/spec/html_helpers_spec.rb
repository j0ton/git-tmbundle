require File.dirname(__FILE__) + "/spec_helper.rb"
describe HtmlHelpers do
  def resource_url(arg); arg; end
  it "should output a javascript_include_tag" do
    javascript_include_tag("prototype.js").should == ["<script src=\"prototype.js\" type=\"text/javascript\"></script>"]
  end
  
  it "should format options_for_javascript, escaping appropriately" do
    options_for_javascript(:controller => "log", :action => "index", :param => 'Grand "old" time').should == %q!{action: "index", controller: "log", param: "Grand \"old\" time"}!
  end
  
  it "should, when called without an :update parameter, render link_to_remote just using dispatch " do
    link_to_remote("link", :params => {:controller => "log", :action => "index", :param => 'Grand "old" time'}).should == 
      %q(<a href="javascript:void(0)" onclick="dispatch({action: &quot;index&quot;, controller: &quot;log&quot;, param: &quot;Grand \&quot;old\&quot; time&quot;})">link</a>)
  end
  
  it "should link to javascript" do
    link_to_function("click", "alert('Hi!');").should == %q(<a href="javascript:void(0)" onclick="alert('Hi!');">click</a>)
  end
  
  it "should render a button_tag" do
    button_tag("Commit", :class => "commit_button").should == %q{<input class="commit_button" name="Commit" type="button" value="Commit" />}
  end
end
jQuery.noConflict();
function getChildren(e) {
  var elm_a = jQuery(e.target);
  var elm_td = elm_a.parents("td");
  var elm_a = elm_td.find("a");
  var elm_tr = elm_td.parents("tr");
  var elm_open = jQuery(elm_tr.find(".folder_open"));
  var elm_close = jQuery(elm_tr.find(".folder_close"));
  var indentStr = elm_td.css("paddingLeft");
  var indent = Number(indentStr.match(/[0-9]+/));
  var next = elm_tr.next();
  var nextIndent = next.find(".ticketname").css("paddingLeft");
  nextIndent = Number(nextIndent.match(/[0-9]+/));
  if (indent == nextIndent) {
    elm_open.show();
    elm_close.hide();
    var url = elm_a.attr("className") + "/" + indent;
    jQuery.get(url,function(res) {
      jQuery(res).insertAfter(elm_tr);
    });
  } else {
    var nexts = elm_tr.nextAll();
    elm_open.hide();
    elm_close.show();
    jQuery.each(nexts,function(i,elm) {
      var n = jQuery(elm).find(".ticketname").css("paddingLeft");
      nIndent = n.match(/[0-9]+/);
      if(indent < nIndent) {
       jQuery(elm).remove();
      } else {
       return false;
      }
    });
  }
}

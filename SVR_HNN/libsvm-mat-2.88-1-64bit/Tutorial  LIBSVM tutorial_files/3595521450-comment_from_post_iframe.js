/* Copyright 2007-8 Google. */ (function() { var f=void 0,g=!0,j=null,k=!1,l="",aa=" ",m='"',ba="#",ca="$$$$",da="%",ea="&",fa="(\\d*)(\\D*)",ga="*",ha=",",p="-src",q=".",r="/",ia="//",ja="0",ka="00",la="000",s=":",ma=": ",na=";domain=",oa=";expires=",pa=";path=",qa=";secure",t="=",ra="?",sa="@",ta="Assertion failed",ua="[",va="[object Array]",wa="[object Function]",xa="[object Window]",ya="\\u",za="]",u="array",Aa="backgroundColor",Ba="blogger-comment-from-post",Ca="blogger-iframe-colorize",Da="blogspotRpcToken",Ea="boolean",Fa="call",Ga="color",
Ha="comment-editor",Ia="fcViewer",Ja="fcauth",Ka="fontFamily",v="function",La="g",Ma="http://www.blogger.com/unvisited-link-",Na="iframe",Oa="inherit",Pa="message",w="null",x="number",y="object",Qa="onmessage",Ra="rgb(0, 0, 0)",Sa="rgba(0, 0, 0, 0)",Ta="serif",Ua="set-comment-editor-height",Va="splice",Wa="string",Xa="transparent",Ya="{",Za="}",z,A=this,$a=function(a){var b=typeof a;if(b==y)if(a){if(a instanceof Array)return u;if(a instanceof Object)return b;var c=Object.prototype.toString.call(a);
if(c==xa)return y;if(c==va||typeof a.length==x&&"undefined"!=typeof a.splice&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable(Va))return u;if(c==wa||"undefined"!=typeof a.call&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable(Fa))return v}else return w;else if(b==v&&"undefined"==typeof a.call)return y;return b},B=function(a){var b=$a(a);return b==u||b==y&&typeof a.length==x},C=function(a){return typeof a==Wa};Math.floor(2147483648*Math.random()).toString(36);
var ab=Date.now||function(){return+new Date},bb=function(a,b){function c(){}c.prototype=b.prototype;a.ba=b.prototype;a.prototype=new c};var D=function(a){Error.captureStackTrace?Error.captureStackTrace(this,D):this.stack=Error().stack||l;a&&(this.message=String(a))};bb(D,Error);var cb=function(a,b){for(var c=1;c<arguments.length;c++)var d=String(arguments[c]).replace(/\$/g,ca),a=a.replace(/\%s/,d);return a},db=function(a,b){for(var c=0,d=String(a).replace(/^[\s\xa0]+|[\s\xa0]+$/g,l).split(q),e=String(b).replace(/^[\s\xa0]+|[\s\xa0]+$/g,l).split(q),h=Math.max(d.length,e.length),i=0;0==c&&i<h;i++){var X=d[i]||l,Y=e[i]||l,Z=RegExp(fa,La),$=RegExp(fa,La);do{var n=Z.exec(X)||[l,l,l],o=$.exec(Y)||[l,l,l];if(0==n[0].length&&0==o[0].length)break;c=((0==n[1].length?0:parseInt(n[1],
10))<(0==o[1].length?0:parseInt(o[1],10))?-1:(0==n[1].length?0:parseInt(n[1],10))>(0==o[1].length?0:parseInt(o[1],10))?1:0)||((0==n[2].length)<(0==o[2].length)?-1:(0==n[2].length)>(0==o[2].length)?1:0)||(n[2]<o[2]?-1:n[2]>o[2]?1:0)}while(0==c)}return c};var eb=function(a,b){b.unshift(a);D.call(this,cb.apply(j,b));b.shift()};bb(eb,D);var fb=function(a,b,c){if(!a){var d=Array.prototype.slice.call(arguments,2),e=ta;if(b)var e=e+(ma+b),h=d;throw new eb(l+e,h||[]);}return a};var E=Array.prototype,gb=E.indexOf?function(a,b,c){fb(a.length!=j);return E.indexOf.call(a,b,c)}:function(a,b,c){c=c==j?0:0>c?Math.max(0,a.length+c):c;if(C(a))return!C(b)||1!=b.length?-1:a.indexOf(b,c);for(;c<a.length;c++)if(c in a&&a[c]===b)return c;return-1},hb=E.forEach?function(a,b,c){fb(a.length!=j);E.forEach.call(a,b,c)}:function(a,b,c){for(var d=a.length,e=C(a)?a.split(l):a,h=0;h<d;h++)h in e&&b.call(c,e[h],h,a)},ib=function(a){return E.concat.apply(E,arguments)},jb=function(a){var b=a.length;
if(0<b){for(var c=Array(b),d=0;d<b;d++)c[d]=a[d];return c}return[]};var kb=function(a){var b=[],c=0,d;for(d in a)b[c++]=a[d];return b},lb=function(a){var b=[],c=0,d;for(d in a)b[c++]=d;return b};var F,mb,G,nb,ob=function(){return A.navigator?A.navigator.userAgent:j};nb=G=mb=F=k;var H;if(H=ob()){var pb=A.navigator;F=0==H.indexOf("Opera");mb=!F&&-1!=H.indexOf("MSIE");G=!F&&-1!=H.indexOf("WebKit");nb=!F&&!G&&"Gecko"==pb.product}var I=mb,qb=nb,rb=G,sb;
a:{var J=l,K;if(F&&A.opera)var tb=A.opera.version,J=typeof tb==v?tb():tb;else if(qb?K=/rv\:([^\);]+)(\)|;)/:I?K=/MSIE\s+([^\);]+)(\)|;)/:rb&&(K=/WebKit\/(\S+)/),K)var ub=K.exec(ob()),J=ub?ub[1]:l;if(I){var vb,wb=A.document;vb=wb?wb.documentMode:f;if(vb>parseFloat(J)){sb=String(vb);break a}}sb=J}var xb=sb,L={},yb={},zb=function(a){return yb[a]||(yb[a]=I&&!!document.documentMode&&document.documentMode>=a)};!I||zb(9);!qb&&!I||I&&zb(9)||qb&&(L["1.9.1"]||(L["1.9.1"]=0<=db(xb,"1.9.1")));I&&(L["9"]||(L["9"]=0<=db(xb,"9")));var Ab=function(a,b,c){c=c||document;a=a&&a!=ga?a.toUpperCase():l;if(c.querySelectorAll&&c.querySelector&&(a||b))b=c.querySelectorAll(a+(b?q+b:l));else if(b&&c.getElementsByClassName)if(c=c.getElementsByClassName(b),a){for(var d={},e=0,h=0,i;i=c[h];h++)a==i.nodeName&&(d[e++]=i);d.length=e;b=d}else b=c;else if(c=c.getElementsByTagName(a||ga),b){d={};for(h=e=0;i=c[h];h++)a=i.className,typeof a.split==v&&0<=gb(a.split(/\s+/),b)&&(d[e++]=i);d.length=e;b=d}else b=c;return b};var M=function(a){this.u=a};M.prototype.X=function(a){var b=[];this.A(a,b);return b.join(l)};M.prototype.A=function(a,b){switch(typeof a){case Wa:this.I(a,b);break;case x:this.R(a,b);break;case Ea:b.push(a);break;case "undefined":b.push(w);break;case y:if(a==j){b.push(w);break}if($a(a)==u){this.Q(a,b);break}this.S(a,b);break;case v:break;default:throw Error("Unknown type: "+typeof a);}};
var Bb={'"':'\\"',"\\":"\\\\","/":"\\/","\b":"\\b","\f":"\\f","\n":"\\n","\r":"\\r","\t":"\\t","\x0B":"\\u000b"},Cb=/\uffff/.test("\uffff")?/[\\\"\x00-\x1f\x7f-\uffff]/g:/[\\\"\x00-\x1f\x7f-\xff]/g;M.prototype.I=function(a,b){b.push(m,a.replace(Cb,function(a){if(a in Bb)return Bb[a];var b=a.charCodeAt(0),e=ya;16>b?e+=la:256>b?e+=ka:4096>b&&(e+=ja);return Bb[a]=e+b.toString(16)}),m)};M.prototype.R=function(a,b){b.push(isFinite(a)&&!isNaN(a)?a:w)};
M.prototype.Q=function(a,b){var c=a.length;b.push(ua);for(var d=l,e=0;e<c;e++)b.push(d),d=a[e],this.A(this.u?this.u.call(a,String(e),d):d,b),d=ha;b.push(za)};M.prototype.S=function(a,b){b.push(Ya);var c=l,d;for(d in a)if(Object.prototype.hasOwnProperty.call(a,d)){var e=a[d];typeof e!=v&&(b.push(c),this.I(d,b),b.push(s),this.A(this.u?this.u.call(a,d,e):e,b),c=ha)}b.push(Za)};var Db="StopIteration"in A?A.StopIteration:Error("StopIteration"),Eb=function(){};Eb.prototype.next=function(){throw Db;};Eb.prototype.Z=function(){return this};var Fb=function(a){if(typeof a.e==v)return a.e();if(C(a))return a.split(l);if(B(a)){for(var b=[],c=a.length,d=0;d<c;d++)b.push(a[d]);return b}return kb(a)};var N=function(a,b){this.f={};this.b=[];var c=arguments.length;if(1<c){if(c%2)throw Error("Uneven number of arguments");for(var d=0;d<c;d+=2)this.set(arguments[d],arguments[d+1])}else a&&this.P(a)};z=N.prototype;z.c=0;z.t=0;z.e=function(){this.s();for(var a=[],b=0;b<this.b.length;b++)a.push(this.f[this.b[b]]);return a};z.m=function(){this.s();return this.b.concat()};z.l=function(a){return O(this.f,a)};
z.remove=function(a){return O(this.f,a)?(delete this.f[a],this.c--,this.t++,this.b.length>2*this.c&&this.s(),g):k};z.s=function(){if(this.c!=this.b.length){for(var a=0,b=0;a<this.b.length;){var c=this.b[a];O(this.f,c)&&(this.b[b++]=c);a++}this.b.length=b}if(this.c!=this.b.length){for(var d={},b=a=0;a<this.b.length;)c=this.b[a],O(d,c)||(this.b[b++]=c,d[c]=1),a++;this.b.length=b}};z.get=function(a,b){return O(this.f,a)?this.f[a]:b};
z.set=function(a,b){O(this.f,a)||(this.c++,this.b.push(a),this.t++);this.f[a]=b};z.P=function(a){var b;a instanceof N?(b=a.m(),a=a.e()):(b=lb(a),a=kb(a));for(var c=0;c<b.length;c++)this.set(b[c],a[c])};z.p=function(){return new N(this)};z.Z=function(a){this.s();var b=0,c=this.b,d=this.f,e=this.t,h=this,i=new Eb;i.next=function(){for(;;){if(e!=h.t)throw Error("The map has changed since the iterator was created");if(b>=c.length)throw Db;var i=c[b++];return a?i:d[i]}};return i};
var O=function(a,b){return Object.prototype.hasOwnProperty.call(a,b)};var Gb=RegExp("^(?:([^:/?#.]+):)?(?://(?:([^/?#]*)@)?([\\w\\d\\-\\u0100-\\uffff.%]*)(?::([0-9]+))?)?([^?#]+)?(?:\\?([^#]*))?(?:#(.*))?$"),Ib=function(a){if(Hb){Hb=k;var b=A.location;if(b){var c=b.href;if(c&&(c=(c=Ib(c)[3]||j)&&decodeURIComponent(c))&&c!=b.hostname)throw Hb=g,Error();}}return a.match(Gb)},Hb=rb;var P=function(a,b){var c;a instanceof P?(this.d=b!==f?b:a.d,this.G(a.n),this.H(a.w),this.B(a.q),this.D(a.r),this.setPath(a.getPath()),this.F(a.g.p()),this.C(a.v)):a&&(c=Ib(String(a)))?(this.d=!!b,this.G(c[1]||l,g),this.H(c[2]||l,g),this.B(c[3]||l,g),this.D(c[4]),this.setPath(c[5]||l,g),this.F(c[6]||l,g),this.C(c[7]||l,g)):(this.d=!!b,this.g=new Q(j,j,this.d))};z=P.prototype;z.n=l;z.w=l;z.q=l;z.r=j;z.J=l;z.v=l;z.$=k;z.d=k;
z.toString=function(){var a=[],b=this.n;b&&a.push(R(b,Jb),s);if(b=this.q){a.push(ia);var c=this.w;c&&a.push(R(c,Jb),sa);a.push(encodeURIComponent(String(b)));b=this.r;b!=j&&a.push(s,String(b))}if(b=this.getPath())this.O()&&b.charAt(0)!=r&&a.push(r),a.push(R(b,b.charAt(0)==r?Kb:Lb));(b=this.N())&&a.push(ra,b);(b=this.v)&&a.push(ba,R(b,Mb));return a.join(l)};z.p=function(){return new P(this)};z.G=function(a,b){this.i();if(this.n=b?a?decodeURIComponent(a):l:a)this.n=this.n.replace(/:$/,l);return this};
z.H=function(a,b){this.i();this.w=b?a?decodeURIComponent(a):l:a;return this};z.B=function(a,b){this.i();this.q=b?a?decodeURIComponent(a):l:a;return this};z.O=function(){return!!this.q};z.D=function(a){this.i();if(a){a=Number(a);if(isNaN(a)||0>a)throw Error("Bad port number "+a);this.r=a}else this.r=j;return this};z.getPath=function(){return this.J};z.setPath=function(a,b){this.i();this.J=b?a?decodeURIComponent(a):l:a;return this};
z.F=function(a,b){this.i();a instanceof Q?(this.g=a,this.g.z(this.d)):(b||(a=R(a,Nb)),this.g=new Q(a,j,this.d));return this};z.N=function(){return this.g.toString()};z.Y=function(a,b){this.i();this.g.set(a,b);return this};z.C=function(a,b){this.i();this.v=b?a?decodeURIComponent(a):l:a;return this};z.i=function(){if(this.$)throw Error("Tried to modify a read-only Uri");};z.z=function(a){this.d=a;this.g&&this.g.z(a);return this};
var R=function(a,b){return C(a)?encodeURI(a).replace(b,Ob):j},Ob=function(a){a=a.charCodeAt(0);return da+(a>>4&15).toString(16)+(a&15).toString(16)},Jb=/[#\/\?@]/g,Lb=/[\#\?:]/g,Kb=/[\#\?]/g,Nb=/[\#\?@]/g,Mb=/#/g,Q=function(a,b,c){this.h=a||j;this.d=!!c};z=Q.prototype;
z.j=function(){if(!this.a&&(this.a=new N,this.c=0,this.h))for(var a=this.h.split(ea),b=0;b<a.length;b++){var c=a[b].indexOf(t),d=j,e=j;0<=c?(d=a[b].substring(0,c),e=a[b].substring(c+1)):d=a[b];d=decodeURIComponent(d.replace(/\+/g,aa));d=this.k(d);this.add(d,e?decodeURIComponent(e.replace(/\+/g,aa)):l)}};z.a=j;z.c=j;z.add=function(a,b){this.j();this.o();var a=this.k(a),c=this.a.get(a);c||this.a.set(a,c=[]);c.push(b);this.c++;return this};
z.remove=function(a){this.j();a=this.k(a);return this.a.l(a)?(this.o(),this.c-=this.a.get(a).length,this.a.remove(a)):k};z.l=function(a){this.j();a=this.k(a);return this.a.l(a)};z.m=function(){this.j();for(var a=this.a.e(),b=this.a.m(),c=[],d=0;d<b.length;d++)for(var e=a[d],h=0;h<e.length;h++)c.push(b[d]);return c};z.e=function(a){this.j();var b=[];if(a)this.l(a)&&(b=ib(b,this.a.get(this.k(a))));else for(var a=this.a.e(),c=0;c<a.length;c++)b=ib(b,a[c]);return b};
z.set=function(a,b){this.j();this.o();a=this.k(a);this.l(a)&&(this.c-=this.a.get(a).length);this.a.set(a,[b]);this.c++;return this};z.get=function(a,b){var c=a?this.e(a):[];return 0<c.length?String(c[0]):b};z.setValues=function(a,b){this.remove(a);0<b.length&&(this.o(),this.a.set(this.k(a),jb(b)),this.c+=b.length)};
z.toString=function(){if(this.h)return this.h;if(!this.a)return l;for(var a=[],b=this.a.m(),c=0;c<b.length;c++)for(var d=b[c],e=encodeURIComponent(String(d)),d=this.e(d),h=0;h<d.length;h++){var i=e;d[h]!==l&&(i+=t+encodeURIComponent(String(d[h])));a.push(i)}return this.h=a.join(ea)};z.o=function(){this.h=j};z.p=function(){var a=new Q;a.h=this.h;this.a&&(a.a=this.a.p());return a};z.k=function(a){a=String(a);this.d&&(a=a.toLowerCase());return a};
z.z=function(a){if(a&&!this.d){this.j();this.o();var b=this.a,c=function(a,b){var c=b.toLowerCase();b!=c&&(this.remove(b),this.setValues(c,a))};if(typeof b.forEach==v)b.forEach(c,this);else if(B(b)||C(b))hb(b,c,this);else{var d;if(typeof b.m==v)d=b.m();else if(typeof b.e!=v)if(B(b)||C(b)){d=[];for(var e=b.length,h=0;h<e;h++)d.push(h)}else d=lb(b);else d=f;for(var e=Fb(b),h=e.length,i=0;i<h;i++)c.call(this,e[i],d&&d[i],b)}}this.d=a};var Pb=function(a,b,c){var d;a:{d=9==b.nodeType?b:b.ownerDocument||b.document;if(d.defaultView&&d.defaultView.getComputedStyle&&(d=d.defaultView.getComputedStyle(b,j))){d=d[a]||d.getPropertyValue(a)||l;break a}d=l}d=d||(b.currentStyle?b.currentStyle[a]:j)||b.style&&b.style[a];return d==j||d==Oa||d==Xa||d==Sa?b==(9==b.nodeType?b:b.ownerDocument||b.document).body||!b.parentNode?c:S(a,b.parentNode):d},S=function(a,b){return Pb(a,b,Ra)};var Qb=function(a){this.M=a},Rb=/\s*;\s*/;z=Qb.prototype;z.U=function(a){return!/[;=\s]/.test(a)};z.V=function(a){return!/[;\r\n]/.test(a)};z.set=function(a,b,c,d,e,h){if(!this.U(a))throw Error('Invalid cookie name "'+a+m);if(!this.V(b))throw Error('Invalid cookie value "'+b+m);c!==f||(c=-1);e=e?na+e:l;d=d?pa+d:l;h=h?qa:l;c=0>c?l:0==c?oa+(new Date(1970,1,1)).toUTCString():oa+(new Date(ab()+1E3*c)).toUTCString();this.W(a+t+b+e+d+c+h)};
z.get=function(a,b){for(var c=a+t,d=this.L(),e=0,h;h=d[e];e++){if(0==h.indexOf(c))return h.substr(c.length);if(h==a)return l}return b};z.remove=function(a,b,c){var d=this.l(a);this.set(a,l,0,b,c);return d};z.m=function(){return this.K().keys};z.e=function(){return this.K().T};z.l=function(a){return this.get(a)!==f};z.W=function(a){this.M.cookie=a};z.L=function(){return(this.M.cookie||l).split(Rb)};
z.K=function(){for(var a=this.L(),b=[],c=[],d,e,h=0;e=a[h];h++)d=e.indexOf(t),-1==d?(b.push(l),c.push(e)):(b.push(e.substring(0,d)),c.push(e.substring(d+1)));return{keys:b,T:c}};var Sb=new Qb(document);Sb.aa=3950;var T=-1,Tb=-1,Ub=function(a){if(T==a&&-1!=T)return Sb.get(Ja+Tb,j);T=-1;return j};var Vb=function(a,b){Tb=b;T=Math.floor(1E7*Math.random());for(var c=Ab(Na,Ba),d=0;d<c.length;d++){var e=C(c[d].id+p)?document.getElementById(c[d].id+p):c[d].id+p,h=new P(e.href);h.Y(Da,T);e.href=h.toString()}window.gadgets&&window.gadgets.rpc&&(gadgets.rpc.setRelayUrl(Ha,a),gadgets.rpc.register(Ia,Ub));c=Ab(Na,Ca);for(d=0;d<c.length;d++){var e=c[d],h=C(e.id+p)?document.getElementById(e.id+p):e.id+p,i=h.href,X=S(Ga,e),Y=S(Aa,e),Z=Pb(Ka,e,Ta);h.href=Ma+(new Date).valueOf();var $=S(Ga,h);h.href=i;i+=
ba+encodeURIComponent((new M(f)).X({color:X,backgroundColor:Y,unvisitedLinkColor:$,fontFamily:Z}));e.src=i}c=function(a){if(a.data.indexOf(Ua)==0)document.getElementById(Ha).height=a.data.substring(26)};window.addEventListener?window.addEventListener(Pa,c,k):window.attachEvent&&window.attachEvent(Qa,c)},U=["BLOG_CMT_createIframe"],V=A;!(U[0]in V)&&V.execScript&&V.execScript("var "+U[0]);for(var W;U.length&&(W=U.shift());)!U.length&&Vb!==f?V[W]=Vb:V=V[W]?V[W]:V[W]={}; })()

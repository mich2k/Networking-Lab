package it.unimore.ingmo;

public class AudioActiveJB {
	protected String seed;
	
	public void setSeed(String s) {
		this.seed=s;
	}
	
	public String getDecay(){
		String ns="";
		char c, symbol='.';
		int n=0, i;
		for (i=0;i < this.seed.length(); i++){
			c=this.seed.charAt(i);
			if (symbol=='.'){
				// initialize: start a new sequence
				symbol=c;
				n=1;
			} else if (c==symbol) {
				// another char in same sequence
				n++;
			} else {
				// start of new sequence
				ns=ns+n+symbol;
				symbol=c;
				n=1;			
			}
		}
		// flush last sequence
		ns=ns+n+symbol;
		this.seed=ns;
		return ns;
	}
}
beer(20).

!start_auction(2).

+!start_auction(N)   // this goal is created by the GUI of the agent
    <- .broadcast(tell, auction(N)).


@pb1[atomic]
+place_bid(N,_)     // receives bids and checks for new winner
   :  .findall(b(V,A),place_bid(N,V)[source(A)],L) &
      .length(L,3)  // all 3 expected bids was received
   <- .max(L,b(V,W));
	  ?beer(M);
      .print("Winner is ",W," with ", V);
      show_winner(N,W); // show it in the GUI
      .broadcast(tell, winner(W));
	  +-beer(M-N);
      .abolish(place_bid(N,_)).

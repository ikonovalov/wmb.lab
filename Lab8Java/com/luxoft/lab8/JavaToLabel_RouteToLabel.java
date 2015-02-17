package com.luxoft.lab8;

import com.ibm.broker.javacompute.MbJavaComputeNode;
import com.ibm.broker.plugin.MbException;
import com.ibm.broker.plugin.MbMessage;
import com.ibm.broker.plugin.MbMessageAssembly;
import com.ibm.broker.plugin.MbOutputTerminal;
import com.ibm.broker.plugin.MbRoute;
import com.ibm.broker.plugin.MbUserException;

public class JavaToLabel_RouteToLabel extends MbJavaComputeNode {

	public void evaluate(MbMessageAssembly assembly) throws MbException {
		MbOutputTerminal out = getOutputTerminal("out");

		try {
			final MbMessage message = assembly.getMessage();
			final String destination = 
					((String) message
					.getRootElement()
					.getFirstElementByPath("/XMLNSC/RouteRequest/destination")
					.getValue()).toUpperCase();
			// ----------------------------------------------------------
			final MbRoute destinationLabel = getRoute (destination + "_label");
			if (destinationLabel != null) { // to label
				destinationLabel.propagate(assembly);
			} else { // to 
				out.propagate(assembly);
			}
			// ----------------------------------------------------------
		} catch (MbException | RuntimeException e) {
			throw e;
		} catch (Exception e) {
			throw new MbUserException(this, "evaluate()", "", "", e.toString(), null);
		}		
	}

}

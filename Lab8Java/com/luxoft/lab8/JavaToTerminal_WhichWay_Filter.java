package com.luxoft.lab8;

import com.ibm.broker.javacompute.MbJavaComputeNode;
import com.ibm.broker.plugin.MbElement;
import com.ibm.broker.plugin.MbException;
import com.ibm.broker.plugin.MbMessage;
import com.ibm.broker.plugin.MbMessageAssembly;
import com.ibm.broker.plugin.MbOutputTerminal;
import com.ibm.broker.plugin.MbUserException;

public class JavaToTerminal_WhichWay_Filter extends MbJavaComputeNode {

	public void evaluate(MbMessageAssembly assembly) throws MbException {
		MbOutputTerminal out = getOutputTerminal("out");
		MbOutputTerminal alt = getOutputTerminal("alternate");
		try {
			MbMessage message = assembly.getMessage();
			// ----------------------------------------------------------
			final MbElement root = message.getRootElement();
			final String destination = (String) root.getFirstElementByPath("/XMLNSC/RouteRequest/destination").getValue();
			switch (destination) {
				case "out":
					out.propagate(assembly);
					break;
				default:
					alt.propagate(assembly);				
			}
			// ----------------------------------------------------------
		} catch (MbException | RuntimeException e) {
			throw e;
		} catch (Exception e) {
			throw new MbUserException(this, "evaluate()", "", "", e.toString(), null);
		}
	}

}
